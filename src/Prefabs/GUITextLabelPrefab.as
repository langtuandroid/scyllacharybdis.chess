package Prefabs 
{
	import com.scyllacharybdis.components.MovieClipComponent;
	import fl.controls.Label;
	import flash.display.MovieClip;

	/**
	 * ...
	 * @author 
	 */
	public class GUITextLabelPrefab extends BasePrefab
	{
        private var _label:Label = new Label;
		
		protected override function createGameObject():void
		{
			var tmpRender:MovieClipComponent = allocate( MovieClipComponent );
			tmpRender.baseclip = new MovieClip();
			tmpRender.baseclip.addChild( _label );
		}			
		
		public function get text():String { return _label.text; }
		
		public function set text(value:String):void 
		{
			_label.text = value;
		}
	}
}