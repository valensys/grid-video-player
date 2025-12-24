/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#if __has_include(<filenameprovider.h>)
#  include <filenameprovider.h>
#endif


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_io_qt_filenameprovider()
{
    QT_WARNING_PUSH QT_WARNING_DISABLE_DEPRECATED
    qmlRegisterTypesAndRevisions<FileNameProvider>("io.qt.filenameprovider", 1);
    QT_WARNING_POP
    qmlRegisterModule("io.qt.filenameprovider", 1, 0);
}

static const QQmlModuleRegistration ioqtfilenameproviderRegistration("io.qt.filenameprovider", qml_register_types_io_qt_filenameprovider);
