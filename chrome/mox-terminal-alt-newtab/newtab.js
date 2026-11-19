const form = document.getElementById("search");
const input = document.getElementById("q");

form.addEventListener("submit", (event) => {
  event.preventDefault();
  const text = input.value.trim();
  if (!text) return;

  if (/^https?:\/\/\S+$/i.test(text)) {
    location.href = text;
  } else if (/^[^\s/]+\.[a-z]{2,}(\/\S*)?$/i.test(text)) {
    location.href = "https://" + text;
  } else {
    chrome.search.query({ text, disposition: "CURRENT_TAB" });
  }
});
