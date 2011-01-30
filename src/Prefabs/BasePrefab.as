package Prefabs 
{
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.BaseObject;
	import com.scyllacharybdis.core.objects.GameObject;
	import com.scyllacharybdis.core.scenegraph.SceneGraph;
	import org.casalib.math.geom.Point3d;
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
		
		/**
		 * Create the prefab
		 */
		public final override function engine_awake():void 
		{
			 _gameObject = allocate(GameObject);
			 _sceneGraph = getDependency(SceneGraph);
		}
		
		/**
		 * Start the prefab
		 */
		public final override function engine_start():void
		{
		}
		
		/**
		 * Stop the prefab
		 */
		public final override function engine_stop():void
		{
		}
		
		/**
		 * Destroy the prefab
		 */
		public final override function engine_destroy():void
		{
			deallocate( _gameObject );
		}

		/**
		 * Override to create the components
		 */
		protected function createGameObject():void
		{
		}		

		/**
		 * Add the object to the sceen
		 */
		public final function addToScene():void
		{
			baseCreateObject();
			_sceneGraph.addGameObjectToScene(_gameObject);
		}
		
		/**
		 * Get the local coordinates position.
		 */
		public function get position():Point3d 
		{ 
			baseCreateObject();
			return _gameObject.position;
		}

		/**
		 * Set the local coordinates position
		 * @param position (Point3d) The position to set the game object
		 */
		public function set position( value:Point3d ):void 
		{ 
			baseCreateObject();
			_gameObject.position = value; 
		}
		
		/**
		 * Get the renderobjects local coordinates scale.
		 */
		public function get scale():Point3d 
		{ 
			baseCreateObject();
			return _gameObject.scale;
		}

		/**
		 * Set the renderobjects local coordinates scale.
		 */
		public function set scale( value:Point3d ):void 
		{ 
			baseCreateObject();
			_gameObject.scale = value; 
		}
		
		/**
		 * Get the local coordinates rotation
		 */		
		public function get rotation():Number 
		{ 
			baseCreateObject();
			return _gameObject.rotation;
		}
		
		/**
		 * Set the local coordinates rotation
		 */
		public function set rotation( value:Number):void 
		{ 
			baseCreateObject();
			_gameObject.rotation = value; 
		}		

		private final function baseCreateObject():void
		{
			baseCreateObject();
			_isCreated = true;			
		}
		
	}

}