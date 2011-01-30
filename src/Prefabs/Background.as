package Prefabs 
{
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.memory.allocate;
	import com.scyllacharybdis.core.memory.deallocate;
	import com.scyllacharybdis.core.objects.BaseObject;
	import com.scyllacharybdis.core.objects.GameObject;

	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class Background extends BaseObject
	{
		private var _gameObject:GameObject;
		
		public override function awake():void 
		{
			 _gameObject = allocate(GameObject);
		}
		
		/**
		 * Start the scene
		 */
		public override function start():void
		{
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			tmpRender.loadMaterial("background.xml", "backgroundsprite");
			_gameObject.addComponent(tmpRender);
			//_gameObject.addComponent( allocate(scriptObject) );
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
			deallocate( _gameObject );
		}
		
		public function get gameObject():GameObject { return _gameObject; }
		
		public function set gameObject(value:GameObject):void 
		{
			_gameObject = value;
		}
	}

}