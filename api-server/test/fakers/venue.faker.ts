import { v4 as uuidv4 } from 'uuid';
import { VenueModel } from "../../src/venues/models/venue.model";

// eslint-disable-next-line @typescript-eslint/no-var-requires
const faker = require('faker')

function generateVenue(venueModel: typeof VenueModel): VenueModel {
  return new venueModel({
    id: uuidv4(),
    name: faker.company.companyName(),
    slug: faker.lorem.slug(),
    address: faker.address.streetAddress(),
    g_map_link: faker.internet.url()
  })
}

export default generateVenue
