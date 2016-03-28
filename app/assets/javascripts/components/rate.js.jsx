var Rate = React.createClass({
    getInitialState: function() {
        return { rate: gon.rate };
    },

    componentDidMount: function() {
        _this = this;
        this.cartSubscription = faye.subscribe('/rate', function (data) {
            _this.updateRate(data.text);
        })
    },

    updateRate: function(rate) {
        this.setState({ rate: rate });
    },
    render: function() {
        return(
            <div>
                <h1>
                    1$ = { this.state.rate } Р
                </h1>
            </div>
        );
    }
});