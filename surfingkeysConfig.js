Visual.style("cursor", "background-color: #9065b7;"); // is there a way to do this by domain? TODO make roam visual fatter to indicate more like normal mode
aceVimMap("jk", "<Esc>", "insert"); // add a :x binding. how?

//Roam stuff
settings.clickableSelector =
  "*.roam-block, *.rm-block-ref, *.rm-title-display, *.roam-log-preview";
// TODO check if this is checked for visual mode too, don't think so (missing .roam-block when the block is empty?
// "isElementClickable"
// settings.editableSelector = "*.roam-block, *.rm-block-ref, *.rm-title-display"; // TODO check surfingkeys to see what this does, sounds promising
// insert mode selector. doesn't work in roam, check surfingkeys code - prolly
// looks for textarea/input elems only and for whatever reason Roam only makes
// the current block you're typing into a textarea
// also breaks f for some reason on roam

// deprecated way, remove
function triggerMouseEvent(node, eventType, triggerWithShift = true) {
  let clickEvent = document.createEvent("MouseEvents");

  clickEvent.initMouseEvent(
    eventType,
    true,
    true,
    window,
    0,
    0,
    0,
    0,
    0,
    false,
    false,
    triggerWithShift,
    false,
    0,
    document.body.parentNode
  );

  node.dispatchEvent(clickEvent);
}

mapkey(
  "F",
  "Roamclick",
  function() {
    //todo need to scope this to roam
    Hints.create(
      "",
      function(element, event) {
        triggerMouseEvent(element, "mousedown"); // shift mousedown to open in sidebar
      },
      { domain: /roamresearch\.com/i }
    );
  },
  { domain: /roamresearch\.com/i } // doesn't work
);

var simulateMouseEvent = function(element, eventName, coordX, coordY) {
  element.dispatchEvent(
    new MouseEvent(eventName, {
      view: window,
      bubbles: true,
      cancelable: true,
      clientX: coordX,
      clientY: coordY,
      button: 0,
    })
  );
};

// TODO file issue - should be vmapkey but doesn't seem to work with the domain feature
mapkey(
  "I",
  "Roam insert after visual cursor placement",
  function() {
    const skCursor = document.querySelector(".surfingkeys_cursor");
    const { x, y } = skCursor.getBoundingClientRect();

    const esc = new KeyboardEvent("keydown", {
      bubbles: true,
      cancelable: true,
      keyCode: 27,
    });
    document.body.dispatchEvent(esc); // or v again?

    const elemFromPoint = document.elementFromPoint(x, y);
    // TODO unsure if all mouseevents needed, weed out any unnecessary
    simulateMouseEvent(elemFromPoint, "mousedown", x, y);
    simulateMouseEvent(elemFromPoint, "mouseup", x, y);
    simulateMouseEvent(elemFromPoint, "click", x, y);
    // TODO if the elem is a link, dont click link, put cursor where it should
    // be (how tho?)
  },
  { domain: /roamresearch\.com/i }
);

// TODO if a block is selected in blue (roam feature), Ctrl I or i should be able to open vim
// buffer and edit it, and it should persist without another enter keypress

// let visual range mode work to delete/change automagically? may not be too
// difficult to implement if it's all in the same block
