package Scenes 
{
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.GameObject;
	import scene.SceneObject;
	
	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class BackgroundScene extends SceneObject
	{
		private var _gameObj:GameObject;
		
		/**
		 * Create the scene
		 */
		public override function awake():void 
		{
			// Create the game object
			_gameObj = allocate( GameObject );
			
			// Create a render component
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			
			// Load the background image
			tmpRender.loadMaterial("background.xml", "backgroundsprite");
			
			// Attach the background image to the gameobject
			_gameObj.addComponent(tmpRender);
		}
		
		/**
		 * Start the scene
		 */
		public override function start():void
		{
			// Add the gameobject to the scene
			addToScene(_gameObj);
		}
		
		/**
		 * Stop the scene
		 */
		public override function stop():void
		{
			// Remove the gameobject from the scene
			removeFromScene(_gameObj);
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