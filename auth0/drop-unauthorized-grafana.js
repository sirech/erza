function dropUnauthorizedGrafana(user, context, callback) {
  if(context.clientName !== "${application}") {
    return callback(null, user, context);
  }

  const auth = context.authorization || {};
  const roles = auth.roles || [];

  if(!roles.includes("${role}")) {
    return callback('Access denied');
  }

  return callback(null, user, context);
}
