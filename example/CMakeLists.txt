project(example)

add_xovi_extension(
        NAME
            xovi_example
        XOVI_FILE
            example.xovi
        SOURCES
            source/main.cpp
)