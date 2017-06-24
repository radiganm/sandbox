/*
    TouchMIDI
    Ben Coleman, April 2016
    slider.js  v1.0  Slider control
*/

function Slider(node, type, colour, label_str) {
  this.node = node;
  this.type = type.toUpperCase();
  this.colour = colour;
  this.dark_colour = shadeBlend(-0.6, this.colour);
  this.min = 0;
  this.max = 127;
  this.val = 0;
  this.label = label_str
  this.midiactions = [];
  this.old_point = {};

  this.node.addEventListener("mousedown", this.eventMouseDown, false);
  this.node.addEventListener("touchstart", this.eventMouseDown, false);

  this.node.firstElementChild.style.color = this.colour;
  this.node.style.borderColor = this.colour;

  this.redraw();
}

// =============================================================================
// Standard event handler called when clicked or touched
// =============================================================================
Slider.prototype.eventMouseDown = function(event) {
  var id = 0;
  if(event.constructor.name != "MouseEvent") {
    id = event.targetTouches[0].identifier;
  }

  event.preventDefault();
  active_widgets['id_'+id] = this.widget;
}

// =============================================================================
// Called from touchmidi.js on mousemove or touchmove associated with this widget
// =============================================================================
Slider.prototype.callMove = function(dx, dy) {
  // Work out new value based on dx or dy
  var new_val = 0;
  if(this.type == 'HORIZONTAL')
    new_val = this.val + dx;
  else
    new_val = this.val -dy;

  // Clamp to min and max
  if(new_val > this.max) new_val = this.max;
  if(new_val < this.min) new_val = this.min;
  this.val = Math.round(new_val);

  this.redraw();
}

// =============================================================================
// Called from touchmidi.js on touch or click release
// =============================================================================
Slider.prototype.callMouseUp = function() {
  this.redraw();
}

// =============================================================================
// Redraw the slider based on current value, then trigger MIDI actions
// =============================================================================
Slider.prototype.redraw = function() {
  if(this.label.indexOf('#') >= 0)
    this.node.firstElementChild.innerHTML = this.label.replace('#', this.val);
  else
    this.node.firstElementChild.innerHTML = this.label;

  var lab_len = Math.max(this.node.firstElementChild.innerHTML.length, 3);
  if(this.type == 'HORIZONTAL')
    this.node.firstElementChild.style.fontSize = (this.node.oh / lab_len) * 5 + "px";
  else
    this.node.firstElementChild.style.fontSize = (this.node.ow / lab_len) * 1.3  + "px";

  var perc = ((this.val-this.min) / (this.max-this.min)) * 100.0
  var angle = 0;
  if(this.type == 'HORIZONTAL') angle = 90;
  this.node.style.background = "linear-gradient("+angle+"deg, "+this.dark_colour+" "+perc+"%, black "+perc+"%";

  // Now trigger all MIDI actions
  for (var i = 0; i < this.midiactions.length; i++) {
    this.midiactions[i].trigger(this.val);
  }
}
