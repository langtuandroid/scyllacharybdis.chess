package Scenes 
{
	import com.scyllacharybdis.components.ScriptComponent;
	import com.scyllacharybdis.components.TextureRenderComponent;
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.objects.GameObject;
	import com.scyllacharybdis.core.objects.SceneObject;

	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class LoginScene extends SceneObject
	{
		/**
		 * Create the scene
		 */
		public override function awake():void 
		{
		}
		
		/**
		 * Start the scene
		 */
		public override function start():void
		{
			var _test:GameObject = allocate( GameObject );
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			tmpRender.loadMaterial("test.xml", "spinnersprite");
			_test.addComponent(tmpRender);
			
			_test.position.x = 0;
			_test.position.y = 0;
			
			// Add the to the scene
			addToScene(_test);
		}
		
		/**
		 * Stop the scene
		 */
		public override function stop():void
		{
		}
		
		/**
		 * Destroy the scene
		 */
		public override function destroy():void
		{
		}
	}

}