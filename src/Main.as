package 
{
	import com.scyllacharybdis.core.events.NetworkEventHandler;
	import com.scyllacharybdis.core.events.NetworkEvents;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.rendering.Renderer;
	import com.scyllacharybdis.core.rendering.Window;
	import com.scyllacharybdis.core.scenes.SceneManager;
	import com.scyllacharybdis.handlers.ChatMessageHandler;
	import com.scyllacharybdis.handlers.ConnectionHandler;
	import com.scyllacharybdis.handlers.LoginHandler;
	import com.scyllacharybdis.handlers.RoomHandler;
	import flash.display.Sprite;
	import flash.events.Event;
	import Scenes.LoginScene;
	
	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class Main extends Sprite 
	{
		private var _window:Window;
		private var _renderer:Renderer;
		private var _sceneManager:SceneManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("init0");
			
			// Create a window
			_window = allocate(Window);
			trace("init1");
			_window.displayContext = this;
			trace("init2");
			
			// Create a rendering system
			_renderer = allocate(Renderer);
			trace("init3");
			
			// Create a network layer
			var _networkHandler:NetworkEventHandler = allocate(NetworkEventHandler);	
			trace("init4");
			
			var _connectionHandler:ConnectionHandler = allocate(ConnectionHandler);
			trace("init5");
			var _loginHandler:LoginHandler = allocate(LoginHandler);
			trace("init6");
			var _roomHandler:RoomHandler = allocate(RoomHandler);
			trace("init7");
			var _chatMessageHandler:ChatMessageHandler = allocate(ChatMessageHandler);
			trace("init8");
			
			// Fire a network connection event
			_networkHandler.fireEvent(NetworkEvents.CONNECT);
			trace("init9");

			// Create the scene manager
			_sceneManager = allocate(SceneManager);
			trace("init10");

			// Display the intro scene
			_sceneManager.PushScene(LoginScene);
			trace("init11");

			addEventListener( Event.ENTER_FRAME, onEnterFrame );
			trace("init12");
		}

		private function onEnterFrame( e:Event ):void
		{
			_renderer.render();
		}
		
	}
	
}