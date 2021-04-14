import ReactOnRails from 'react-on-rails';

import Following from '../bundles/Following/components/Following';
import Followers from '../bundles/Followers/components/Followers';

// This is how react_on_rails can see the Following in the browser.
ReactOnRails.register({
  Following,
  Followers
});
