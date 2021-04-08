let currentUser;

const baseUrl = 'http://localhost:3000'

function getCurrentUser() {
  fetch(baseUrl + "/current_user", {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify(localStorage.getItem('user_id'))
  })
    .then(resp => resp.json())
    .then(data => {
      currentUser = data;
      document.getElementById('email').innerText = currentUser.email;
    })
}

document.addEventListener('DOMContentLoaded', function() {
  // get current_user and display
  getCurrentUser();
})