import ReactOnRails from 'react-on-rails';

import Followers from '../bundles/Followers/components/Followers';

// This is how react_on_rails can see the Followers in the browser.
ReactOnRails.register({
  Followers,
});
