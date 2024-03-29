package Scenes 
{
	import com.scyllacharybdis.components.ScriptComponent;
	import com.scyllacharybdis.components.TextureRenderComponent;
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.GameObject;
	import scene.SceneObject;

	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class LoginScene extends SceneObject
	{
		private var _gameObj:GameObject;
		
		/**
		 * Create the scene
		 */
		public override function awake():void 
		{
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
			_gameObj.position.x = 0;
			_gameObj.position.y = 0;
			
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
		}
		
		/**
		 * Destroy the scene
		 */
		public override function destroy():void
		{
			deallocate( _gameObj );
		}
	}

}