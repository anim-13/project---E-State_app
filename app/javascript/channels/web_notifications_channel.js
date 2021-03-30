import consumer from "./consumer"

consumer.subscriptions.create("WebNotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#msg').append('<div class="message"> ' + data.name+ '</div>')
    console.log("Recieving:");
    console.log(data.name); 
  }
});
