var OrganizationsDisplay = React.createClass({
  getInitialState: function() {

    return { organizations: [], currentPage: 1, searchTerm: null, techSizeSearch: null, techStacks: null };
  },

  componentDidMount: function() {
    var organizations = this.props.organizations.map(function(organization) {
      return <Organization organization = { organization }
                           key = { organization.id } />
    }.bind(this));
    this.setState({organizations: organizations});
    console.log("App Component is mounted");
  },

  filterOrganizations: function() {
    var searchTerm = this.refs.searchInput.value.toLowerCase();
    this.setState({ searchTerm: searchTerm });
  },
  loadMore: function() {
    var newPage = (this.state.currentPage + 1);
      $.ajax({
        url: "http://localhost:3000/organizations.json?page=" + newPage,
        method: "GET",
        error: function() {
          alert("Can't load more questions");
        },
        success: function(data) {
          console.log(data)
          var newElements = data.map(function(organization) {
            return <Organization organization = { organization }
                                 key = { organization.id }/>
          });
          this.setState({organizations: this.state.organizations.concat(newElements), currentPage: newPage})
        }.bind(this)
      });
    },

   render: function() {
    return <div>
              <input id="organization-search" type="text" className="form-control" placeholder="Search" ref="searchInput" onChange= { this.filterOrganizations } ></input>

              <select id="team-size" className="form-control" ref="sizeInput" onChange= { this.filterOrganizationTechSize } >
                <option value="0" defaultValue> Team Size </option>
                <option value="1"> 25 or less </option>
                <option value="2"> 26 - 50 </option>
                <option value="3"> 50 or more </option>
              </select>
              <br />
              <div className="clearfix"></div>
              <div className="container-fluid text-center">
                <div className="row">
                  { this.state.organizations }
                </div>
                <a href="javascript:void(0);" onClick={this.loadMore}>Load more...</a>
              </div>
              <br />
            </div>;
  }
});
