// Contador para MARIE.js
// Cuenta las cantidades de instrucciones que lleva
// llegar hasta un cierto break point especificado a
// traveś de un número de linea

(function main() {
  console.log("Comenzó el contador");
  const CLICK_DELAY_MS = 20;
  let instructions = 0;
  const timer = setInterval(() => {
    const LINE_BREAK = 48;
    const MAX_OVERFLOW = 1000;

    const stepButton = document.getElementById("step");

    if (stepButton?.disabled === true) {
      clearInterval(timer);
      alert("Requiere ensamblar primero");
      return;
    }

    const highlightedLineElement =
      document?.getElementsByClassName("highlighted-line");
    const highlightedLine =
      highlightedLineElement.length === 1
        ? parseInt(
            highlightedLineElement[0].parentElement.children[1].children[0]
              .innerHTML,
          )
        : -1;

    if (highlightedLine === LINE_BREAK) {
      alert(`Instrucciones: ${instructions}`);
      clearInterval(timer);
      return;
    } else if (highlightedLine >= MAX_OVERFLOW) {
      console.error(
        "Never reached the line break. Is it right? the break and the code?",
      );
      clearInterval(timer);
      return;
    }

    stepButton.click();
    instructions++;
    console.log(`instrucciones: ${instructions}`);
  }, CLICK_DELAY_MS);
})();
