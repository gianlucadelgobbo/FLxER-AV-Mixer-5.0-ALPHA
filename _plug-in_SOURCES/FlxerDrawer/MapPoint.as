package {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.net.*;
	import flash.events.*;
    import flash.display.Graphics;
	import flash.geom.Rectangle;

	public class MapPoint extends Sprite{
		var currentShape;
		var myId;
		var fnz;
		var shape;
		var handle;
		var line;
		var firstTime;
		public function MapPoint(p:Array,a:uint,b:uint,f:Function,c:Boolean) {
			x = p[2];
			y = p[3];
			firstTime = false;
			currentShape = a;
			myId = b;
			fnz = f;
			shape = new Sprite();
			handle = new Sprite();
			handle.x = p[0]-p[2];
			handle.y = p[1]-p[3];
			line = new Sprite();
			shape.buttonMode = true;
			trace("MapPoint"+myId)
			handle.buttonMode = true;

			shape.graphics.beginFill(0x0000FF,1);
			shape.graphics.moveTo(-3,-3);
			shape.graphics.lineTo(3,-3);
			shape.graphics.lineTo(3,3);
			shape.graphics.lineTo(-3,3);
			shape.graphics.lineTo(-3,-3);
            shape.graphics.endFill();
			handle.graphics.beginFill(0x0000FF,1);
            handle.graphics.drawCircle(0, 0, 3);
            handle.graphics.endFill();

			shape.addEventListener(MouseEvent.MOUSE_DOWN, shapeMouseDown);
			shape.addEventListener(MouseEvent.MOUSE_UP, stopDragShape);
			handle.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			handle.addEventListener(MouseEvent.MOUSE_UP, stopDragHandle);
			this.addChild(line);
			this.addChild(shape);
			this.addChild(handle);
			if (c && myId) {
				//handle.startDrag(true, new Rectangle(-p[2]-(FlxerDrawerPlugIn.w/2), -p[3]-(FlxerDrawerPlugIn.h/2), FlxerDrawerPlugIn.w,FlxerDrawerPlugIn.h));
				handle.startDrag(true);
				this.addEventListener(Event.ENTER_FRAME, updatePath);
			}
			if (handle.x+handle.y!=0) {
				line.graphics.lineStyle(1, 0x0000FF);
				line.graphics.moveTo(0, 0);
				line.graphics.lineTo(handle.x, handle.y);
			}

			//shape.dragParent = true;
		}
		private function handleMouseDown(event:Event):void {
			trace("handleMouseDown"+event)
			//handle.startDrag(true, new Rectangle(-x-(FlxerDrawerPlugIn.w/2), -y-(FlxerDrawerPlugIn.h/2), FlxerDrawerPlugIn.w,FlxerDrawerPlugIn.h));
			handle.startDrag(true);
			this.addEventListener(Event.ENTER_FRAME, updatePath);
		}
		public function stopDragHandle(event:Event):void {
			if (myId != 0 || firstTime) {
				trace("stopDragHandle"+event)
				this.removeEventListener(Event.ENTER_FRAME, updatePath);
				handle.stopDrag();
				updatePath(event);
				if (Math.abs(handle.x)<3 && Math.abs(handle.y)<3) {
					this.removeChild(handle);
					this.removeChild(line);
				}
			}
			firstTime = true;
		}
		private function shapeMouseDown(event:Event):void {
			trace("shapeMouseDown"+event)
			//this.startDrag(true, new Rectangle(-x-(FlxerDrawerPlugIn.w/2), -y-(FlxerDrawerPlugIn.h/2), FlxerDrawerPlugIn.w,FlxerDrawerPlugIn.h));
			this.startDrag(true);
			this.addEventListener(Event.ENTER_FRAME, updatePath);
		}
		public function stopDragShape(event:Event):void {
			trace("stopDragShape"+event)
				this.removeEventListener(Event.ENTER_FRAME, updatePath);
				this.stopDrag();
				updatePath(event);
		}
		function updatePath(event:Event):void {
            line.graphics.clear();
			line.graphics.lineStyle(1, 0x0000FF);
			line.graphics.moveTo(0, 0);
			line.graphics.lineTo(handle.x, handle.y);
			trace("updatePath"+this)
			fnz(currentShape,myId, x+handle.x,y+handle.y, x, y);
		}
	}
}
