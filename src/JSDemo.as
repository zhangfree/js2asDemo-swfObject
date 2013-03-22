/*
* Copyright(c) 2012 the original author or authors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
* either express or implied. See the License for the specific language
* governing permissions and limitations under the License.
*/
package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.system.Security;
	import flash.utils.setTimeout;
	
	/**
	 * @author zhangji
	 */
	public class JSDemo extends Sprite
	{
		public function JSDemo()
		{
			Security.allowDomain("*");
			setTimeout(init,500);
		}
		
		private function init():void
		{
			var sp:Sprite = new Sprite();
			sp.graphics.lineStyle(1);
			sp.graphics.beginFill(0xFFFF00);
			sp.graphics.drawCircle(100,100,100);
			sp.graphics.endFill();
			sp.buttonMode = true;
			sp.addEventListener(MouseEvent.CLICK,onClickSpHandler);
			this.addChild(sp);
			
			ExternalInterface.addCallback("callFlash",onCallFlashHandler);
		}
		
		private function onClickSpHandler(evt:MouseEvent):void
		{
			ExternalInterface.call("callJavascript");
		}
		
		private function onCallFlashHandler():void
		{
			trace("2222222222222");
			var sp:Sprite = new Sprite();
			sp.graphics.lineStyle(1);
			sp.graphics.beginFill(0xFF0000);
			sp.graphics.drawCircle(100,100,100);
			sp.graphics.endFill();
			sp.x = Math.random()*50+100;
			sp.y = Math.random()*50+100;
			this.addChild(sp);
		}
	}
}
