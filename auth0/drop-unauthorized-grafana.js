/**
 * Handler that will be called during the execution of a PostLogin flow.
 *
 * @param {Event} event - Details about the user and the context in which they are logging in.
 * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
 *
 */
exports.onExecutePostLogin = async (event, api) => {
  if(event.client.name !== "${application}") {
    return;
  }

  const auth = event.authorization || { roles: [] };
  const roles = auth.roles || [];
  
  if(!roles.includes("${role}")) {
    return api.access.deny('access denied.');
  }
};
