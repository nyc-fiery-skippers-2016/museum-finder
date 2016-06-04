var Category = React.createClass({
  render: function() {
    // debugger
    return (
      <li className="category">

        <div className="category-content">
          <p>
            <span className="name">{this.props.category.name}</span>
          </p>
        </div>
      </li>
      )
  }
})