package demo

class UploadArticleFeaturedImageService {

    def articleGormService

    Article uploadFeatureImage(FeaturedImageCommand cmd) {
        byte[] bytes = cmd.featuredImageFile.bytes
        String contentType = cmd.featuredImageFile.contentType
        articleGormService.updateArticleFeaturedImage(cmd.id, cmd.version, bytes, contentType)
    }
}
