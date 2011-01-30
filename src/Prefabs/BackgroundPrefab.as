package Prefabs 
{
	/**
	 * ...
	 * @author 
	 */
	public class BackgroundPrefab extends BasePrefab 
	{
		protected function createGameObject():void
		{
			var tmpRender:XMLRenderComponent = allocate( XMLRenderComponent );
			tmpRender.loadMaterial("background.xml", "backgroundsprite");
			_gameObject.addComponent(tmpRender);
			//_gameObject.addComponent( allocate(scriptObject) );
		}			
	}

}