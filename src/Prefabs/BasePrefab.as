package Prefabs 
{
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.BaseObject;
	import com.scyllacharybdis.core.objects.GameObject;
	import com.scyllacharybdis.core.scenegraph.SceneGraph;
	/**
	 * ...
	 * @author 
	 */
	
	[Requires ("com.scyllacharybdis.core.scenegraph.SceneGraph")]
	public class BasePrefab extends BaseObject
	{
		private var _sceneGraph:SceneGraph;
		private var _gameObject:GameObject;
		private var _isCreated:Boolean = false;
		
		public final override function engine_awake():void 
		{
			 _gameObject = allocate(GameObject);
			 _sceneGraph = getDependency(SceneGraph);
		}
		
		/**
		 * Start the scene
		 */
		public final override function engine_start():void
		{
		}
		
		/**
		 * Stop the scene
		 */
		public final override function engine_stop():void
		{
		}
		
		/**
		 * Destroy the scene
		 */
		public final override function engine_destroy():void
		{
			deallocate( _gameObject );
		}
		
		public final function addToScene():void
		{
			if ( _isCreated == false )
			{
				createGameObject();
			}
			_sceneGraph.addGameObjectToScene(_gameObject);
		}

		protected function createGameObject():void
		{
			//var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			//tmpRender.loadMaterial("background.xml", "backgroundsprite");
			//_gameObject.addComponent(tmpRender);
			//_gameObject.addComponent( allocate(scriptObject) );
		}		
		
		
	}

}