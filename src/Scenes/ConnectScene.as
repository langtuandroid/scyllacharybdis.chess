package Scenes 
{
	import com.scyllacharybdis.components.ScriptComponent;
	import com.scyllacharybdis.components.TextureRenderComponent;
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.events.NetworkEventHandler;
	import com.scyllacharybdis.core.events.NetworkEvents;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.GameObject;
	import scene.SceneManager;
	import scene.SceneObject;

	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	[Requires ("com.scyllacharybdis.core.events.NetworkEventHandler", "scene.SceneManager")]
	public class ConnectScene extends SceneObject
	{
		private var _networkHandler:NetworkEventHandler;
		private var _sceneManager:SceneManager;
		private var _gameObj:GameObject;
		
		/**
		 * Create the scene
		 */
		public override function awake():void 
		{
			// Get the network handler
			_networkHandler = getDependency( NetworkEventHandler );
			_sceneManager = getDependency( SceneManager );

			// Allocate the gameobject 
			_gameObj = allocate( GameObject );
			
			// Create the render component
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			
			// Load the material 
			tmpRender.loadMaterial("test.xml", "spinnersprite");
			
			// Attach render componet to the gameobject
			_gameObj.addComponent(tmpRender);
			
		}
		
		/**
		 * Start the scene
		 */
		public override function start():void
		{
			// Setup the listeners
			_networkHandler.addEventListener( NetworkEvents.CONNECTION_REQUEST_SUCCESS, this, onConnectSuccess );
			_networkHandler.addEventListener( NetworkEvents.CONNECTION_REQUEST_FAILED, this, onConnectFailed );

			// Set the position
			_gameObj.position.x = 50;
			_gameObj.position.y = 50;
			
			// Fire a network connection event
			_networkHandler.fireEvent(NetworkEvents.CONNECT_REQUEST);
			
			// Add the gameobject to the scene
			addToScene(_gameObj);
		}
		
		/**
		 * Stop the scene
		 */
		public override function stop():void
		{
			// Remove the game object from the scene
			removeFromScene( _gameObj );

			// Remove the listeners
			_networkHandler.removeEventListener( NetworkEvents.CONNECTION_REQUEST_SUCCESS, this, onConnectSuccess );
			_networkHandler.removeEventListener( NetworkEvents.CONNECTION_REQUEST_FAILED, this, onConnectFailed );
		}
		
		/**
		 * Destroy the scene
		 */
		public override function destroy():void
		{
			deallocate( _gameObj );
		}
		
		public function onConnectSuccess(evt:NetworkEvents):void
		{
			trace("connection success");

			// Push the login screen
			_sceneManager.PushScene( LoginScene );
		}
		
		public function onConnectFailed(evt:NetworkEvents):void
		{
			trace("connection failed");
		}		
	}

}