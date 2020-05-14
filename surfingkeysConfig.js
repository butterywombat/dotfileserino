//Roam stuff
settings.clickableSelector =
  "*.roam-block, *.rm-block-ref, *.rm-title-display, *.roam-log-preview";

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
        triggerMouseEvent(element, "mousedown");
      },
      { domain: /roamresearch\.com/i }
    );
  },
  { domain: /roamresearch\.com/i }
);
