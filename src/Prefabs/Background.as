package Prefabs 
{
	import com.scyllacharybdis.components.XMLRenderComponent;
	import com.scyllacharybdis.core.objects.GameObject;
	/**
	 * ...
	 * @author Scylla and Charybdis Dev Team
	 */
	public class Background extends GameObject
	{
		public override function awake():void 
		{
		}
		
		/**
		 * Start the scene
		 */
		public override function start():void
		{
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			tmpRender.loadMaterial("background.xml", "backgroundsprite");
			this.addComponent(tmpRender);
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