import PropTypes from 'prop-types';
import React, { useState } from 'react';

const Following = (props) => {
  const [name, setName] = useState(props.name);

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

Following.propTypes = {
  name: PropTypes.string.isRequired, // this is passed from the Rails view
};

export default Following;
