const initAddCategoriesFilter = (daysToDisplay, choices) => {

    const events = document.querySelectorAll('#events');

    // if (event.detail.value === "0") {
    //   choices.removeActiveItems(event.detail.id);
    //   events.forEach(element => {
    //     element.style.display = '';
    //   });
    // } else {
    //   events.forEach(element => {
    //     element.style.display = 'none';
    //   });
    // }

    
    for (let i=0; i < choices.passedElement.element.length; i++) {
      if (parseInt(choices.passedElement.element[i].value) != 0){           
        choices.removeActiveItemsByValue("0");
      }
    }

    for (let i=0; i < choices.passedElement.element.length; i++) {
      const specificCategoryEvents = document.querySelectorAll('#category-' + choices.passedElement.element[i].value);
      specificCategoryEvents.forEach(element => {
        element.parentNode.parentNode.parentNode.parentNode.style.display = '';
      });
    }
}
    
const initRemoveCategoriesFilter = (daysToDisplay, choices) => {
    
    const events = document.querySelectorAll('#events');

    // if (choices.passedElement.element.length === 0){
    //   choices.setChoiceByValue("0");
    //   events.forEach(element => {
    //     element.style.display = '';
    //   });
    // } else {
    //   events.forEach(element => {
    //     element.style.display = 'none';
    //   });
    // }

    for (let i=0; i < choices.passedElement.element.length; i++) {
      const specificCategoryEvents = document.querySelectorAll('#category-' + choices.passedElement.element[i].value);
      specificCategoryEvents.forEach(element => {
        element.parentNode.parentNode.parentNode.parentNode.style.display = '';
      });
    }
    
}

export { initAddCategoriesFilter, initRemoveCategoriesFilter };