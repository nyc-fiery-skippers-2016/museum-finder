// var CategoryContainer = React.createClass({
//   getInitialState: function() {
//     return {categories: []}
//   },
//   componentDidMount: function() {
//     $.ajax({
//       url: 'http://localhost:3000/categories',
//       dataType: 'json'
//     }).done(function(response){
//       console.log('response', response)
//       this.setState({categories: response});
//     }.bind(this));
//   },
//   render: function() {
//     var categories = this.state.categories;
//     // debugger
//     return (
//       <section id="categories-container">
//        <h3>Categories</h3>
//        <div className="row">
//         <ul>
//           {categories.map(function(category){
//             return(
//                 <Category key={category.id} category={category}/>
//               )
//           })}
//         </ul>
//         </div>
//       </section>
//     )
//   }
// });