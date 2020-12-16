Visual.style('cursor', 'background-color: #9065b7;'); // is there a way to do this by domain? TODO make roam visual fatter to indicate more like normal mode
aceVimMap('jk', '<Esc>', 'insert'); // add a :x binding. how?

//Roam stuff
settings.clickableSelector = '*.roam-block, *.rm-block-ref, *.rm-title-display, *.roam-log-preview';
// TODO check if this is checked for visual mode too, don't think so (missing .roam-block when the block is empty?
// "isElementClickable"
// settings.editableSelector = "*.roam-block, *.rm-block-ref, *.rm-title-display"; // TODO check surfingkeys to see what this does, sounds promising
// insert mode selector. doesn't work in roam, check surfingkeys code - prolly
// looks for textarea/input elems only and for whatever reason Roam only makes
// the current block you're typing into a textarea
// also breaks f for some reason on roam

const simulateMouseEvent = function(element, eventNames, { x, y } = {}, shiftKey = false) {
  if (typeof eventNames === 'string') eventNames = [eventNames];
  eventNames.forEach(eventName => {
    element.dispatchEvent(
      // synchronous
      new MouseEvent(eventName, {
        view: window,
        bubbles: true,
        cancelable: true,
        clientX: x,
        clientY: y,
        button: 0,
        shiftKey
      })
    );
  });
};

const clickAtSFCursor = () => {
  const skCursor = document.querySelector('.surfingkeys_cursor');
  const { x, y } = skCursor.getBoundingClientRect();

  const esc = new KeyboardEvent('keydown', {
    bubbles: true,
    cancelable: true,
    keyCode: 27
  });
  document.body.dispatchEvent(esc); // or v again?

  const elemFromPoint = document.elementFromPoint(x, y); // span etc
  // TODO unsure if all mouseevents needed, weed out any unnecessary
  simulateMouseEvent(elemFromPoint, ['mousedown', 'mouseup', 'click'], { x, y });
  // console.log('clicked');
  return { x, y };
  // TODO if the elem is a link, dont click link, put cursor where it should
  // be (how tho?)
};

// TODO file issue - should be vmapkey but doesn't seem to work with the domain feature, though logs work in clickAtSFCursor (whaat)
// still rather buggy in roam after doing i. V location doesn't restore and
// sometimes V doesn't work again until you do v
mapkey('i', 'Roam insert after visual cursor placement', clickAtSFCursor, { domain: /roamresearch\.com/i });

mapkey(
  '<Ctrl-f>',
  'Roam shift f (open in sidebar)',
  function() {
    Hints.create('', function(el) {
      // dispatchMouseEvent(el, ["mousedown", "click", "mouseup"], true); // from surfingkeys, seems like behavior is different for some reason though code looked the same. left sidebar opens in new tab, main window links do not open

      // TODO left sidebar links open in new window (why?), main window links open correctly
      simulateMouseEvent(el, ['mousedown', 'click', 'mouseup'], undefined, true); // shift mousedown to open in sidebar
    });
  },
  { domain: /roamresearch\.com/i }
);

unmapAllExcept(['f', 'F', '/', 'C', '?', 't', 'T', 'r', 'S', 'cs', 'cS'], /roamresearch\.com/i);

mapkey(
  'd',
  'Roam delete after visual range selected',
  () => {
    let selection = getSelection();
    const { x, y } = clickAtSFCursor();
    setTimeout(() => {
      const newElemFromPt = document.elementFromPoint(x, y);
      console.log('newElemFromPt should be textarea', newElemFromPt);
      console.log('x', x);
      console.log('y', y);
      console.log('chars to del:', selection.extentOffset - selection.anchorOffset); // research these offsets, there were many on there then click for insert and remove
      newElemFromPt.setSelectionRange(selection.extentOffset, selection.anchorOffset); // then delete
      selection = getSelection();
      selection.deleteFromDocument();
    });
  },
  { domain: /roamresearch\.com/i }
);

// TODO if a block is selected in blue (roam feature), Ctrl I or i should be able to open vim
// buffer and edit it, and it should persist without another enter keypress

// let visual range mode work to delete/change automagically? may not be too
// difficult to implement if it's all in the same block
//
// TODO implement U undo
