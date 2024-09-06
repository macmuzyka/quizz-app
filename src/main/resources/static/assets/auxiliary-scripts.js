function clearLists() {
    document.getElementById('answer-list').innerHTML = ''
    document.getElementById('auxiliary-list').innerHTML = ''
}

function clearTeamPoints() {
    document.getElementById('red-team-points').textContent = "0"
    document.getElementById('blue-team-points').textContent = "0"
}

function setButtonsForEndgame() {
    document.getElementById('next-stage-btn').disabled = true
    document.getElementById('start-game-btn').disabled = false
}

function nextStageButtonClickable() {
    document.getElementById('next-stage-btn').disabled = false
}

function bothTeamsPointsFrozen() {
    let addPointsBlue = document.getElementById('add-points-blue');
    addPointsBlue.classList.remove('clickable');
    addPointsBlue.classList.add('unclickable');
    addPointsBlue.textContent = "Round end"
    addPointsBlue.style.color = 'black'
    let addPointsRed = document.getElementById('add-points-red');
    addPointsRed.classList.remove('clickable');
    addPointsRed.classList.add('unclickable');
    addPointsRed.textContent = "Round end"
    addPointsRed.style.color = 'black'
}