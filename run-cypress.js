const cypress = require("cypress");

async function main() {
  const result = await cypress.run();

  // If any tests have failed, results.failures is non-zero, some tests have failed
  if (result.failures) {
    console.error(`${result.failures} number cypress tests have failed`);
    console.error(result.message);
    return 1;
  }

  return 0;
}

main()
  .then((code) => (process.exitCode = code))
  .catch((e) => {
    console.error("Cypress encountered unexpected exception. Exiting.", e);
    process.exitCode = 3;
  });
