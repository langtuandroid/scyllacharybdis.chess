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
		
		protected function createGameObject():void
		{
		}		
		
		public final function addToScene():void
		{
			if ( _isCreated == false )
			{
				createGameObject();
			}
			_sceneGraph.addGameObjectToScene(_gameObject);
		}
		
		/**
		 * Get the local coordinates position.
		 */
		public function get position():Point3d 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}
			
			return _gameObject.position;
		}

		/**
		 * Set the local coordinates position
		 * @param position (Point3d) The position to set the game object
		 */
		public function set position( value:Point3d ):void 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}			
			_gameObject.position = value; 
		}
		
		/**
		 * Get the renderobjects local coordinates scale.
		 */
		public function get scale():Point3d 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}			
			return _gameObject.scale;
		}

		/**
		 * Set the renderobjects local coordinates scale.
		 */
		public function set scale( value:Point3d ):void 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}			
			_gameObject.scale = value; 
		}
		
		/**
		 * Get the local coordinates rotation
		 */		
		public function get rotation():Number 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}			
			return _gameObject.rotation;
		}
		
		/**
		 * Set the local coordinates rotation
		 */
		public function set rotation( value:Number):void 
		{ 
			if ( _isCreated == false )
			{
				createGameObject();
			}			
			_gameObject.rotation = value; 
		}		
		
	}

}