import { Boat } from 'src/boats/interfaces/boats.interface';
import { Route } from 'src/routes/interfaces/routes.interface';
import { Rower } from 'src/rowers/interfaces/rowers.interface';

export interface Session {
  id: number;
  estimatedStartDateTime: Date | null;
  estimatedEndDateTime: Date | null;
  startDateTime: Date | null;
  endDateTime: Date | null;
  distance: number | null;
  rowers: Rower[];
  boat: Boat;
  route: Route | null;
}
