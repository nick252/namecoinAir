package ourGui
{
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	
	import vk.gui.InputField;
	/**
	 * @author namecoinAir
	 */
	public class SimpleAlert extends Sprite
	{
		public function SimpleAlert(text:String)
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0x000000,0.2);
			sprite.graphics.drawRect(0,0,380,170);
			sprite.graphics.endFill();
			this.addChild(sprite);
			sprite.x = 150;
			sprite.y = 150;
			
			var spriteText:InputField = new InputField(20,30,200,4,false);
			spriteText.scaleX = 1.7
			spriteText.scaleY = 1.7	
			spriteText.textField.text =text;
			sprite.addChild(spriteText);
			sprite.filters = [new BevelFilter(8,60)];
		}
	}
}