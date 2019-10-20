exports.get404 = (req, res) => {
    res.json({
        'error': {
            'code': '404',
            'message': 'Page not found!'
        }
    });
};