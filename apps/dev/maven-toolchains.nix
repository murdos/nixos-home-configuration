{ pkgs, ... }:

with pkgs; {
  home.file.".m2/toolchains.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <toolchains>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>1.8</version>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk8}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>11</version>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk11}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>17</version>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk17}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>21</version>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk21}</jdkHome>
        </configuration>
      </toolchain>
      <toolchain>
        <type>jdk</type>
        <provides>
          <version>25</version>
        </provides>
        <configuration>
          <jdkHome>${pkgs.openjdk25}</jdkHome>
        </configuration>
      </toolchain>
    </toolchains>
  '';
}
