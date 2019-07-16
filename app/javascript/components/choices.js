import Choices from 'choices.js';

const initChoices = (daysToDisplay) => {
  const choices = new Choices('#categories-selection', {
    removeItemButton: true,
    classNames: {
      highlightedState: 'is-active',
    }
  });

  choices.passedElement.element.addEventListener('addItem', function(event) {

    if (choices.passedElement.element[choices.passedElement.element.length-1].value === "0") {
      choices.removeActiveItems(event.detail.id);
    }
    
    for (let i=0; i < choices.passedElement.element.length; i++) {
      if (parseInt(choices.passedElement.element[i].value) != 0){           
        choices.removeActiveItemsByValue("0");
      }
    }
  }, false);

  choices.passedElement.element.addEventListener('removeItem', function(event) {
    
    if (choices.passedElement.element.length === 0){
        choices.setChoiceByValue("0");
    }
    
  }, false);
}

export { initChoices };