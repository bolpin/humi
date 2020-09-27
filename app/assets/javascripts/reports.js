const fetchAndDisplayJson = async () => {
  const response = await fetch('http://localhost:3000/reports/new.json?grant_id=53');
  const grantJson = await response.json();

  console.log(grantJson);

  display(grantJson);
}

const display = (grantJson) => {
  let reportBody = document.getElementById("report-body");

  if (reportBody) {
    reportBody.innerHTML = JSON.stringify(grantJson);
  }
}



