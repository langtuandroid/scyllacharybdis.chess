package Scenes 
{
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.objects.GameObject;
	import com.scyllacharybdis.core.objects.SceneObject;
	import Prefabs.Background;
	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class GameScene extends SceneObject
	{
		private var _background:Background;
		
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
			_background = allocate( Background );
			
			_background.gameObject.position.x = 0;
			_background.gameObject.position.y = 0;
			
			// Add the to the scene
			addToScene(_background.gameObject);
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