export const rowersSelector = {
  id: true,
  firstname: true,
  lastname: true,
};

export const rowersOnSessionsSelector = {
  rowerId: false,
  sessionId: false,
  rower: {
    select: rowersSelector,
  },
};
