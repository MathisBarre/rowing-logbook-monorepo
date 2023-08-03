import { boatSelector } from '../../boats/selectors/boats.selector';
import { routeSelector } from '../../sessions/selectors/routes.selector';
import { rowersOnSessionsSelector } from '../../rowers/selectors/rowers.selector';

export const sessionsSelector = {
  id: true,
  estimatedStartDateTime: true,
  estimatedEndDateTime: true,
  startDateTime: true,
  endDateTime: true,
  distance: true,
  rowers: {
    select: rowersOnSessionsSelector,
  },
  boatId: false,
  boat: {
    select: boatSelector,
  },
  routeId: false,
  route: {
    select: routeSelector,
  },
  clubId: false,
  club: false,
};
