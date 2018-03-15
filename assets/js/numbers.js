import { Socket } from "phoenix";

export default function numberGenerator() {
  let socket = new Socket("/socket", {});
  socket.connect();

  let channel = socket.channel("number:lobby", {})

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })
    .receive("timeout", () => { console.log("Networking issue...") })

  channel.push("msg", {})
    .receive("ok", (msg) => { console.log("msg", msg) })
    .receive("error", (reasons) => { console.log("error", reasons) })
    .receive("timeout", () => { console.log("Networking issue...") })
}