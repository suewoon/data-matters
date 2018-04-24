class Config:
    """Default configuration
    """
    DEBUG = False
    TESTING = False 


class DevelopmentConfig(Config):
    """Development configurations 
    """
    # Enable Flask's debugging features. Should be False in production 
    DEBUG = True
    SQLALCHEMY_ECHO = True


class ProductionConfig(Config):
    """Production configurations 
    """


class TestingConfig(Config):
    """Testing configurations
    """
    TESTING = True


app_config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'testing': TestingConfig
}
