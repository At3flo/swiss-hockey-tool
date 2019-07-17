const initTeamFilter = (element) => {

  const teamSelector = document.getElementById("teams");
  const teamSelected = teamSelector.options[teamSelector.selectedIndex].value;
  
  if (teamSelected != 0) {
    element.style.display = 'none';

    const specificTeamEvents = document.querySelectorAll('#team-' + teamSelected);
    specificTeamEvents.forEach(element => {
      element.parentNode.parentNode.parentNode.style.display = '';
    });
  } else {
    element.style.display = '';
  }
}

export {
  initTeamFilter
};