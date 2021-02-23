function calc (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inputValue = price.value; 
    const feePrice = document.getElementById("add-tax-price");
    feePrice.innerHTML = Math.floor(inputValue / 10);
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(inputValue - feePrice.innerHTML);         
  });
}

window.addEventListener( 'load', calc);