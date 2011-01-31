package 
{
	import com.scyllacharybdis.core.events.NetworkEventHandler;
	import com.scyllacharybdis.core.events.NetworkEvents;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.rendering.Renderer;
	import com.scyllacharybdis.core.rendering.Window;
	import com.scyllacharybdis.handlers.ChatMessageHandler;
	import com.scyllacharybdis.handlers.ConnectionHandler;
	import com.scyllacharybdis.handlers.LoginHandler;
	import com.scyllacharybdis.handlers.RoomHandler;
	import flash.display.Sprite;
	import flash.events.Event;
	import scene.SceneManager;
	import Scenes.BackgroundScene;
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
			
			// Create a window
			_window = allocate(Window);
			_window.displayContext = this;
			
			// Create a rendering system
			_renderer = allocate(Renderer);
			
			// Create a network layer
			var _networkHandler:NetworkEventHandler = allocate(NetworkEventHandler);
			
			var _connectionHandler:ConnectionHandler = allocate(ConnectionHandler);
			var _loginHandler:LoginHandler = allocate(LoginHandler);
			var _roomHandler:RoomHandler = allocate(RoomHandler);
			var _chatMessageHandler:ChatMessageHandler = allocate(ChatMessageHandler);
			
			// Fire a network connection event
			_networkHandler.fireEvent(NetworkEvents.CONNECT);

			// Create the scene manager
			_sceneManager = allocate(SceneManager);

			// Display the intro scene
			_sceneManager.PushScene(BackgroundScene);
			// Don't hide the background
			_sceneManager.PushScene(LoginScene, false);
			//_sceneManager.PushScene(GameScene);

			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}

		private function onEnterFrame( e:Event ):void
		{
			_renderer.render();
		}
		
	}
	
}