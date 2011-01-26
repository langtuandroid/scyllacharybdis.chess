package Scenes 
{
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
			trace("LoginScene0");
			var _test:GameObject = allocate( GameObject );
			trace("LoginScene1");
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			trace("LoginScene2");
			tmpRender.loadTexture("test.png");//.loadMaterial("test.xml", "spinnersprite");
			trace("LoginScene3");
			_test.addComponent(tmpRender);
			trace("LoginScene4");
			
			// Add the to the scene
			addToScene(_test);
			trace("LoginScene5");
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