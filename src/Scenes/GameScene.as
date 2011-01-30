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
		private var _background:GameObject;
		
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
			
			_background.position.x = 0;
			_background.position.y = 0;
			
			// Add the to the scene
			addToScene(_background);
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