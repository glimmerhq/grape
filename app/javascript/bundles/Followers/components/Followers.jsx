import PropTypes from 'prop-types';
import React, { useState } from 'react';

const Followers = (props) => {
  const [name, setName] = useState(props.username);

  return (
    <div>
      <h3>Hello, {name}!</h3>
      <hr />
      <form>
        <label htmlFor="name">
          Say hello to:
          <input id="name" type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
      </form>
    </div>
  );
};

Followers.propTypes = {
  name: PropTypes.string.isRequired, // this is passed from the Rails view
};

export default Followers;
