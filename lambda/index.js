exports.handler = async (event) => {
    const bucket = event.Records[0].s3.bucket.name;
    const filename = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, " "));

    console.log(`Image received: ${filename}`);

    return {
        statusCode: 200,
        body: JSON.stringify(`Successfully logged image: ${filename}`),
    };
};
